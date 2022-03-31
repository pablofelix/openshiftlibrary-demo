try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools

    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name="ods-ci",
    version="0.1",
    description="OpenShiftLibrary Demo",
    author="Pablo Félix Estévez Pico",
    author_email="pestevez@redhat.com",
    install_requires=[
        "reportportal-client",
        "robotframework>=4",
        "robotframework-debuglibrary",
        "robotframework-requests",
        "robotframework-seleniumlibrary",
        "robotframework-jupyterlibrary>=0.3.1",
        "robotframework-openshift==1.0.0",
        "ipython",
        "pytest",
        "pytest-logger",
        "pyyaml",
        "pygments",
        "requests",
        "robotframework-requests",
        "escapism",
        "semver>=2,<3"
    ],
    zip_safe=True,
    include_package_data=True,
    packages=find_packages(exclude=["ez_setup"]),
)

