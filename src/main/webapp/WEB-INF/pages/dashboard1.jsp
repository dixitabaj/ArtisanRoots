<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Handcrafted Wonders - Product Dashboard</title>
    <style>
        :root {
            --primary: #8B5A2B;
            --secondary: #D2B48C;
            --light: #F5F5DC;
            --dark: #3E2723;
            --success: #4CAF50;
            --warning: #FFC107;
            --danger: #F44336;
            --info: #2196F3;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f9f5f0;
            color: #333;
        }
        
        .container {
            max-width: 1400px;
            margin: 0 auto;
            padding: 20px;
        }
        
        /* Header */
        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
        }
        
        .dashboard-title {
            font-size: 28px;
            color: var(--dark);
            margin: 0;
        }
        
        .last-updated {
            color: #666;
            font-size: 14px;
        }
        
        /* Main Layout */
        .main-layout {
            display: grid;
            grid-template-columns: 1fr 1.5fr; /* Right column now wider */
            gap: 30px; /* Increased gap */
        }
        
        .left-column, .right-column {
            display: flex;
            flex-direction: column;
            gap: 30px; /* Increased gap */
        }
        
        /* Stats Grid */
        .stats-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        
        .stat-card {
            background: white;
            border-radius: 10px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            min-height: 120px;
        }
        
        .stat-card h3 {
            margin-top: 0;
            color: var(--primary);
            font-size: 16px;
        }
        
        .stat-card .value {
            font-size: 28px;
            font-weight: bold;
            margin: 10px 0 5px 0;
        }
        
        .stat-card .trend {
            font-size: 14px;
            display: flex;
            align-items: center;
        }
        
        .trend.up {
            color: var(--success);
        }
        
        .trend.down {
            color: var(--danger);
        }
        
        /* Activities */
        .activities-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            flex-grow: 1;
        }
        
        .activities-card h2 {
            margin-top: 0;
            color: var(--dark);
            font-size: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        
        .activity-item {
            padding: 15px 0;
            border-bottom: 1px solid #f5f5f5;
        }
        
        .activity-item:last-child {
            border-bottom: none;
        }
        
        .activity-type {
            font-weight: 500;
            margin-bottom: 5px;
            font-size: 16px;
        }
        
        .activity-details {
            color: #666;
            font-size: 14px;
            margin-bottom: 5px;
        }
        
        .activity-time {
            color: #999;
            font-size: 12px;
        }
        
        /* Top Products - Now larger */
        .top-products-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            flex-grow: 1;
            min-height: 300px; /* Minimum height */
        }
        
        .top-products-card h2 {
            margin-top: 0;
            color: var(--dark);
            font-size: 22px; /* Slightly larger */
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
            font-size: 15px; /* Slightly larger font */
        }
        
        th, td {
            padding: 15px; /* More padding */
            text-align: left;
            border-bottom: 1px solid #eee;
        }
        
        th {
            background-color: var(--light);
            color: var(--dark);
            font-weight: 600;
            font-size: 15px;
        }
        
        tr:hover {
            background-color: #f9f9f9;
        }
        
        .status-active {
            color: var(--success);
            font-weight: 500;
        }
        
        .status-low-stock {
            color: var(--warning);
            font-weight: 500;
        }
        
        /* Metrics */
        .metrics-card {
            background: white;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            height: 290px;
        }
        
        .metrics-card h2 {
            margin-top: 0;
            color: var(--dark);
            font-size: 20px;
            border-bottom: 1px solid #eee;
            padding-bottom: 15px;
            margin-bottom: 20px;
        }
        
        .metric-item {
            margin-bottom: 20px;
        }
        
        .metric-label {
            font-weight: 500;
            color: var(--primary);
            margin-bottom: 8px;
            font-size: 16px;
        }
        
        .metric-value {
            font-size: 16px;
        }
        
        /* Responsive */
        @media (max-width: 1200px) {
            .main-layout {
                grid-template-columns: 1fr;
            }
            
            .stats-grid {
                grid-template-columns: repeat(4, 1fr);
            }
        }
        
        @media (max-width: 992px) {
            .stats-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }
        
        @media (max-width: 768px) {
            .stats-grid {
                grid-template-columns: 1fr;
            }
            
            .dashboard-header {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .last-updated {
                margin-top: 10px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="dashboard-header">
            <h1 class="dashboard-title">Product Dashboard</h1>
            <div class="last-updated">Last updated: Today, 10:45 AM</div>
        </div>
        
        <div class="main-layout">
            <div class="left-column">
                <!-- Four Stat Boxes -->
                <div class="stats-grid">
                    <div class="stat-card">
                        <h3>Current Revenue</h3>
                        <div class="value">₹122,222</div>
                        <div class="trend up">↑ 12% from last month</div>
                    </div>
                    <div class="stat-card">
                        <h3>Current Sales</h3>
                        <div class="value">87</div>
                        <div class="trend up">↑ 8% from last month</div>
                    </div>
                    <div class="stat-card">
                        <h3>Active Products</h3>
                        <div class="value">24</div>
                        <div class="trend">No change</div>
                    </div>
                    <div class="stat-card">
                        <h3>Low Stock Items</h3>
                        <div class="value">3</div>
                        <div class="trend down">↓ 1 from last week</div>
                    </div>
                </div>
                
                <!-- Recent Activities -->
                <div class="activities-card">
                    <h2>Recent Activities</h2>
                    <div class="activity-item">
                        <div class="activity-type">New product added</div>
                        <div class="activity-details">Product ID: 1011 added successfully</div>
                        <div class="activity-time">10:30 AM</div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-type">Product updated</div>
                        <div class="activity-details">Product ID: 1021 updated successfully</div>
                        <div class="activity-time">09:45 AM</div>
                    </div>
                    <div class="activity-item">
                        <div class="activity-type">Product deleted</div>
                        <div class="activity-details">Product ID: 2022 removed</div>
                        <div class="activity-time">Yesterday, 4:15 PM</div>
                    </div>
                </div>
            </div>
            
            <div class="right-column">
                <!-- Metrics Overview -->
                <div class="metrics-card">
                    <h2>Metrics Overview</h2>
                    <div class="metric-item">
                        <div class="metric-label">Number of Sales</div>
                        <div class="metric-value">87</div>
                    </div>
                    <div class="metric-item">
                        <div class="metric-label">Total Revenue</div>
                        <div class="metric-value">₹122,222</div>
                    </div>
                    <div class="metric-item">
                        <div class="metric-label">Most Trending</div>
                        <div class="metric-value">Wireless Earbuds</div>
                    </div>
                    <div class="metric-item">
                        <div class="metric-label">Least Sold</div>
                        <div class="metric-value">Bluetooth Speaker</div>
                    </div>
                </div>
                
                <!-- Top Products Table - Now Larger -->
                <div class="top-products-card">
                    <h2>Top Performing Products</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Product ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Sales</th>
                                <th>Revenue</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1011</td>
                                <td>Wireless Earbuds Pro</td>
                                <td>₹2,499</td>
                                <td>42</td>
                                <td>₹104,958</td>
                                <td class="status-active">Active</td>
                            </tr>
                            <tr>
                                <td>1005</td>
                                <td>Smart Watch X3</td>
                                <td>₹5,999</td>
                                <td>18</td>
                                <td>₹107,982</td>
                                <td class="status-active">Active</td>
                            </tr>
                            <tr>
                                <td>1021</td>
                                <td>Bluetooth Speaker</td>
                                <td>₹1,299</td>
                                <td>5</td>
                                <td>₹6,495</td>
                                <td class="status-low-stock">Low Stock</td>
                            </tr>
                             
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>