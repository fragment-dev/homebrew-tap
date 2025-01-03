require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6033.0.0-darwin-x64.tar.gz"
    sha256 "53f6666472924e2fe4cbecd392f51e0a8d221c395b43d80632c93f8983163646"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6033.0.0-darwin-arm64.tar.gz"
      sha256 "9eb9487f8d147e815616c1319915caf420dfb56c97653bf03bf8520842a29846"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6033.0.0-linux-x64.tar.gz"
    sha256 "c1646d5e596da773ad5a8a3d7108958342375c04225b8a4ecbfe570ee40877e4"
  end
  version "6033.0.0"
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
