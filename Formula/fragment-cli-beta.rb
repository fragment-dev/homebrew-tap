require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5309.0.0-darwin-x64.tar.gz"
    sha256 "321dead9a6f9555b2181fe046ebd060b6dd9a945a560ecf904270b7c10cac5d2"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5309.0.0-darwin-arm64.tar.gz"
      sha256 "c6616674afefe7ff712fbd52578c88588b02001146a3fb443254c8befdb0a3d0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5309.0.0-linux-x64.tar.gz"
    sha256 "e9de7f21af443a854a312d9640e9638018275211a3fd29848e553d9b7004c91b"
  end
  version "5309.0.0"
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
