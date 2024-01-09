require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4297.0.0-darwin-x64.tar.gz"
    sha256 "e891092b4255174eb9b903fc8d5b58eda0855bd6694f3f57118320fd8e98036f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4297.0.0-darwin-arm64.tar.gz"
      sha256 "3c75af9d6efbd86e9a2c4c3d9427737361a92fccb44e09032934a53271f14562"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4297.0.0-linux-x64.tar.gz"
    sha256 "3dfbd22492c2de4e6a53c6788c305c7b0ef03c9ab4e5e59d2066ea51dd24485b"
  end
  version "4297.0.0"
  license "MIT"
  depends_on "node@18"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
