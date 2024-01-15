require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4334.0.0-darwin-x64.tar.gz"
    sha256 "6ab8780dd9e73e029d19f4efa0fd8b12d29bf113fbedecd2d3cf2ec981510790"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4334.0.0-darwin-arm64.tar.gz"
      sha256 "1a72c58a2e67284b0c549fb84cbb861889b83faca292f5c3fbb2979237738bae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4334.0.0-linux-x64.tar.gz"
    sha256 "5296fe92ed08bd213e7416d60c747c6166e86446386afe1f72447ae72cb66874"
  end
  version "4334.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
