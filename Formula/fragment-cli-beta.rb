require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3255.0.0-darwin-x64.tar.gz"
    sha256 "036baf5be3f71f2c3cc3d0327db1951de4d97ab985cb30d2fed27357666e442a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3255.0.0-darwin-arm64.tar.gz"
      sha256 "cf70e9e23d0170fee2db029d7d9bc50002e639dc6a41dc20ff38b391deabf123"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3255.0.0-linux-x64.tar.gz"
    sha256 "03cd7de822c6644cf441a1ec8f4d6eebc921c29e4d8f2b30fe43c4ea2b706e6b"
  end
  version "3255.0.0"
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
