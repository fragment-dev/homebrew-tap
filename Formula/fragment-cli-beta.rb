require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3535.0.0-darwin-x64.tar.gz"
    sha256 "51b85a6d9baaa5314664fe8d276404d8052ea56d4decef01425ca7991aeb31e2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3535.0.0-darwin-arm64.tar.gz"
      sha256 "5afb81503bbd1deb10ddc6b1d20554d061c28e70e6f300d5ae3676897ef10d06"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3535.0.0-linux-x64.tar.gz"
    sha256 "371c30760a7b4defe24e1f7651e9071a81a7ecf9b0092f72d2851d4f0e0b07e2"
  end
  version "3535.0.0"
  license "MIT"
  depends_on "node@16"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
