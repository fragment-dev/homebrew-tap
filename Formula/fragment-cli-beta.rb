require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2927.0.0-darwin-x64.tar.gz"
    sha256 "44e8982746fdd54cf3721ffcfb33b61c0305e2604341883fabb5c64894ad8eb0"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2927.0.0-darwin-arm64.tar.gz"
      sha256 "a6369dba2c2c85251d689fce61223ef3ce7c8a8bc328a7fbab7139b823cc554c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2927.0.0-linux-x64.tar.gz"
    sha256 "0e9bb0ce925066d278e7078af9428271c9efaa7658c49db348830775eef25429"
  end
  version "2927.0.0"
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
