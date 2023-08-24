require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3388.0.0-darwin-x64.tar.gz"
    sha256 "fbd06297db8c69ae3b8ec964b98775181f326f9765f4dbe37ae8c53776832650"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3388.0.0-darwin-arm64.tar.gz"
      sha256 "6ee09d35b9d23702510ad29ca065a95e49f5650aa3d5df0eba6881db71257694"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3388.0.0-linux-x64.tar.gz"
    sha256 "225952f72f6adffc49787ae0e0570237b6a11671ee09706c7c1f03eadd9a6bef"
  end
  version "3388.0.0"
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
