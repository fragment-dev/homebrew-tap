require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2730.0.0-darwin-x64.tar.gz"
    sha256 "9ca1ee60cb8406f6206e325d2f58ca09caeb3550dd58270a01ef5637b464f908"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2730.0.0-darwin-arm64.tar.gz"
      sha256 "d16df222a2242ee8f0ba60fa99530f1a7a8b1c669c7f3c45c0fb8c9c7788eba8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2730.0.0-linux-x64.tar.gz"
    sha256 "ed15a9570217b4d484793e5b793644d016e458b595aca154f96485a62470815f"
  end
  version "2730.0.0"
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
