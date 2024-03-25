require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4807.0.0-darwin-x64.tar.gz"
    sha256 "64761b627525dcc50a06af155268ba863e03d13eb0cc9b706f9d7c0dbfb2a663"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4807.0.0-darwin-arm64.tar.gz"
      sha256 "5c9c4a3710ceacccee2ef5fe93d342b87f3ea016e32cd12b50879ea411f29934"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4807.0.0-linux-x64.tar.gz"
    sha256 "260e8c70dfd1f27e504946622700b131696d92ba4db582350ec9b745dab1c435"
  end
  version "4807.0.0"
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
