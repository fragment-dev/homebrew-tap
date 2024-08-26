require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5540.0.0-darwin-x64.tar.gz"
    sha256 "75f951a3dde72d6326819abee823d493e098308ac86daf4db434b8cc30fb168f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5540.0.0-darwin-arm64.tar.gz"
      sha256 "8b7bdcd3393243bcd2d25af72add0d744d1e47b4a53e934c60996ba72b588b09"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5540.0.0-linux-x64.tar.gz"
    sha256 "5933df6bace497aa8d8eee64ce43bea82759851befa9c13b1862f9de4060fa1c"
  end
  version "5540.0.0"
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
