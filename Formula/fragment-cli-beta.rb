require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3159.0.0-darwin-x64.tar.gz"
    sha256 "5827f55b36fc82eb7da6632d92c4979a3841b45636e9fb2716f2631245acebfa"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3159.0.0-darwin-arm64.tar.gz"
      sha256 "2f1c79eff4fe4e97ab3599a6bb2cd43dc7fefffe714b5e51d07caefc80f9032b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3159.0.0-linux-x64.tar.gz"
    sha256 "aa2d07c9b40df6f413209e9b284758dbc9287bced556b66a674a8fcbb59e575f"
  end
  version "3159.0.0"
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
