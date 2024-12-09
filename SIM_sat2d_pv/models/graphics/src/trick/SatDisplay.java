/*
 * Trick
 * 2016 (c) National Aeronautics and Space Administration (NASA)
 */

package trick;

import java.awt.Graphics2D;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.Shape;
import java.awt.geom.Ellipse2D;
import java.awt.geom.AffineTransform;
import java.awt.image.AffineTransformOp;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.net.Socket;
import java.util.*;
import javax.swing.ImageIcon;
import javax.swing.JFrame;
import javax.swing.JPanel;
import java.awt.Color;

/**
 *
 * @author penn
 */

class SkyView extends JPanel {

    private double scale; // Pixels per meter
    private Color skyColor;
    private Color planetColor;
    private Color satelliteColor;
    private Color satelliteColor2;
    private int planetRadius;
    private int sat1_Radius;
    private int sat2_Radius;
    private double[] satellitePos;
    private double[] satellitePos2;

    // Origin of world coordinates in jpanel coordinates.
    private int worldOriginX;
    private int worldOriginY;

    public SkyView( double mapScale ) {
        scale = mapScale;
        setScale(mapScale);
        skyColor = Color.BLACK;
        planetColor = new Color(128,128,255);
        satelliteColor = new Color(255,0,0);
        satelliteColor2 = new Color(60,179,113);
        planetRadius = 6378000;
        sat1_Radius = planetRadius + 200000;      // dyn.satellite.pos[1]     - EARTH_RADIUS
        sat2_Radius = planetRadius + 2110500;     // dyn.satellite.pos_tgt[1] - EARTH_RADIUS;
        satellitePos  = new double[] {0.0, sat1_Radius};
        satellitePos2 = new double[] {0.0, sat2_Radius};
    }

    public void setSatPos (double x, double y) {
        satellitePos[0] = x;
        satellitePos[1] = y;
    }

    public void setSatPos2 (double x, double y) {
        satellitePos2[0] = x;
        satellitePos2[1] = y;
    }

    public void setScale (double mapScale) {
        if (mapScale < 0.00005) {
            scale = 0.00005;
        } else {
            scale = mapScale;
        }
    }

    public void drawCenteredOval(Graphics2D g, int x, int y, int rh, int rv) {
        x = x-(rh/2);
        y = y-(rv/2);
        g.drawOval(x,y,rh,rv);
    }

    public void fillCenteredCircle(Graphics2D g, int x, int y, int r) {
        x = x-(r/2);
        y = y-(r/2);
        g.fillOval(x,y,r,r);
    }

    private void doDrawing(Graphics g) {
        Graphics2D g2d = (Graphics2D) g;

        int width = getWidth();
        int height = getHeight();

        worldOriginX = (width/2);
        worldOriginY = (height/2);

        g2d.setPaint(Color.BLACK);
        g2d.fillRect(0, 0, width, height);

        int pr0    = (int)(scale * planetRadius);
        int pr_v1  = (int)(scale * sat1_Radius);
        int pr_v2  = (int)(scale * sat2_Radius);
        int pr30 = (int)(scale * planetRadius * Math.cos(Math.toRadians(30)));
        int pr60 = (int)(scale * planetRadius * Math.cos(Math.toRadians(60)));

        g2d.setPaint(satelliteColor);
        drawCenteredOval(g2d, worldOriginX, worldOriginY, 2*pr_v1, 2*pr_v1);
        g2d.setPaint(satelliteColor2);
        drawCenteredOval(g2d, worldOriginX, worldOriginY, 2*pr_v2, 2*pr_v2);

        //  Draw Planet
        g2d.setPaint(planetColor);
        fillCenteredCircle(g2d, worldOriginX, worldOriginY, 2 * pr0);

        g2d.setPaint(Color.BLACK);

        // Circles of Latitude
        g2d.drawLine(worldOriginX - pr60, worldOriginY - pr30 , worldOriginX + pr60, worldOriginY - pr30);
        g2d.drawLine(worldOriginX - pr30, worldOriginY - pr60 , worldOriginX + pr30, worldOriginY - pr60);
        g2d.drawLine(worldOriginX - pr0,  worldOriginY, worldOriginX + pr0, worldOriginY ); // Equator
        g2d.drawLine(worldOriginX - pr30, worldOriginY + pr60 , worldOriginX + pr30, worldOriginY + pr60);
        g2d.drawLine(worldOriginX - pr60, worldOriginY + pr30 , worldOriginX + pr60, worldOriginY + pr30);

        // Meridians
        g2d.drawLine(worldOriginX, worldOriginY - pr0, worldOriginX, worldOriginY + pr0 );
        drawCenteredOval(g2d, worldOriginX, worldOriginY, 2 * pr60, 2 * pr0);
        drawCenteredOval(g2d, worldOriginX, worldOriginY, 2 * pr30, 2 * pr0);
        drawCenteredOval(g2d, worldOriginX, worldOriginY, 2 * pr0, 2 * pr0);

        //  Draw Satellite
        g2d.setPaint(satelliteColor);
        int sx = (int)(worldOriginX + scale * satellitePos[0]);
        int sy = (int)(worldOriginY - scale * satellitePos[1]);
        fillCenteredCircle(g2d, sx, sy, (int)(10));
        g2d.setPaint(satelliteColor2);
        int sx2 = (int)(worldOriginX + scale * satellitePos2[0]);
        int sy2 = (int)(worldOriginY - scale * satellitePos2[1]);
        fillCenteredCircle(g2d, sx2, sy2, (int)(10));
    }

    @Override
    public void paintComponent(Graphics g) {
        super.paintComponent(g);
        doDrawing(g);
    }
}

public class SatDisplay extends JFrame {

    private SkyView skyView;
    private BufferedReader in;
    private DataOutputStream out;

    public SatDisplay(SkyView sky) {
        skyView = sky;
        add( skyView);
        setTitle("Orbit Display");
        //setSize(800, 800);
        setSize(1200, 1200);
        setLocationRelativeTo(null);
        setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
    }

    public void connectToServer(String host, int port ) throws IOException {
        Socket socket = new Socket(host, port);
        in = new BufferedReader( new InputStreamReader( socket.getInputStream()));
        out = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
    }

    public void drawSkyView() {
        skyView.repaint();
    }

    private static void  printHelpText() {
        System.out.println(
            "----------------------------------------------------------------------\n"
          + "usage: java jar SatDisplay.jar <port-number>\n"
          + "----------------------------------------------------------------------\n"
          );
    }

    public static void main(String[] args) throws IOException {

        String host = "localHost";
        int port = 0;
        String vehicleImageFile = null;

        int ii = 0;
        while (ii < args.length) {
            switch (args[ii]) {
                case "-help" :
                case "--help" : {
                    printHelpText();
                    System.exit(0);
                } break;
                default : {
                    port = (Integer.parseInt(args[ii]));
                } break;
            }
            ++ii;
        }

        if (port == 0) {
            System.out.println("No variable server port specified.");
            printHelpText();
            System.exit(0);
        }

        double mapScale = 0.00005; // 20,000 meters per pixel
        SkyView skyview = new SkyView( mapScale);
        SatDisplay sd = new SatDisplay(skyview);
        sd.setVisible(true);
        double satX = 0.0;
        double satY = 0.0;
        double satX2 = 0.0;
        double satY2 = 1.0;

        System.out.println("Connecting to: " + host + ":" + port);
        sd.connectToServer(host, port);

        sd.out.writeBytes("trick.var_set_client_tag(\"SatDisplay\") \n" +
                          "trick.var_pause() \n" +
                          "trick.var_add(\"dyn.satellite.pos[0]\") \n" +
                          "trick.var_add(\"dyn.satellite.pos[1]\") \n" +
                          "trick.var_add(\"dyn.satellite.pos_tgt[0]\") \n" +
                          "trick.var_add(\"dyn.satellite.pos_tgt[1]\") \n" +
                          "trick.var_ascii() \n" +
                          "trick.var_cycle(0.1) \n" +
                          "trick.var_unpause()\n" );
        sd.out.flush();

        Boolean go = true;

        while (go) {
            String field[];
            try {
                String line;
                line = sd.in.readLine();
                field = line.split("\t");
                satX = Double.parseDouble( field[1] );
                satY = Double.parseDouble( field[2] );
                satX2 = Double.parseDouble( field[3] );
                satY2 = Double.parseDouble( field[4] );

                // Set the Satellite position
                skyview.setSatPos(satX, satY);
                skyview.setSatPos2(satX2, satY2);

            } catch (IOException | NullPointerException e ) {
                go = false;
            }
            sd.drawSkyView();
        }
    }
}
