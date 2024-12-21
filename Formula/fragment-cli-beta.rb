require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5956.0.0-darwin-x64.tar.gz"
    sha256 "d165bcc5717f9f4f47a7c6ff3ef4a344adf0444a50f28868de01a382f48ab349"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5956.0.0-darwin-arm64.tar.gz"
      sha256 "ed8bacb4995a4f14990f4db285d7e348c2e78e5a45e32a7b2df80e741b3818c2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5956.0.0-linux-x64.tar.gz"
    sha256 "1ab35db6b1dd25ed437485ecce68c33bcba7830ceed3c5987064dbf719d51ae0"
  end
  version "5956.0.0"
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
