require "language/node"

class FragmentCli < Formula
  desc "The FRAGMENT CLI allows you to interact with the FRAGMENT API and develop your chart of accounts"
  homepage "https://fragment.dev"
  on_macos do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-darwin-x64.tar.gz"
    sha256 "b5d616a1d3ad984abfdff64ad34122801b1aae703fa0fc0d33390a5829086c7c"
    on_arm do
      url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-darwin-arm64.tar.gz"
      sha256 "a5b1a74138a86942d48e513975bcf21438d3235f1c99c5cd0f1164344434e2e9"
    end
  end
  on_linux do
    url "https://prod-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2023.4.19-4-linux-x64.tar.gz"
    sha256 "0f766ab239ba1d1024a6a27d11aeecaff6a69c1f35f3ed605a1510dc0e490db5"
  end
  version "2023.4.19-4"
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
