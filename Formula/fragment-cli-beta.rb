require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2951.0.0-darwin-x64.tar.gz"
    sha256 "13dec5b1f26801bbfe52b09c2695754f043e6a9ed8323d03de3f556cbc8cb085"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2951.0.0-darwin-arm64.tar.gz"
      sha256 "3c1b20850e6401d3ae29498fe08534dc55bcad54e760e83aacf7bd1ebbc6256a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2951.0.0-linux-x64.tar.gz"
    sha256 "d8efd457ce7d7819f668dbd1c15aabd0ff05d30f0d9ceacde20078d4588aa3a3"
  end
  version "2951.0.0"
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
