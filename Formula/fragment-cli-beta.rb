require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5614.0.0-darwin-x64.tar.gz"
    sha256 "336665c7e3a03d43977b31d87d47379bff0af164f6cf0bf82e58d37bd0903e6c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5614.0.0-darwin-arm64.tar.gz"
      sha256 "bc8c4880f32535ab65d753501b53fbb9ce738bdc6bf8469be2dd1c42d13ed222"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5614.0.0-linux-x64.tar.gz"
    sha256 "cdff4069b86301972e73fdc78d3b4196cd2986b78bcb2d614d8ae1cc9ea45e29"
  end
  version "5614.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
