require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5301.0.0-darwin-x64.tar.gz"
    sha256 "6a1c5060d16ca6aa4f14548e42094d764c368087916aefea99ad52cd7fbe940a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5301.0.0-darwin-arm64.tar.gz"
      sha256 "a932d6e07428f38ab5af2fc947e4a1924ea655e51f373bc13618f3dcfff149d2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5301.0.0-linux-x64.tar.gz"
    sha256 "9873bde4204f33c450922166a26eeb38f74ed2a058b3167ac717377315fa912c"
  end
  version "5301.0.0"
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
