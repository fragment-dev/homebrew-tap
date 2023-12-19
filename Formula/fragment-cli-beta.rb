require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4175.0.0-darwin-x64.tar.gz"
    sha256 "251e22ffe731b3cd94b288d3bbdfb7a7d52593f03bf857358924bbd6f71c5d24"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4175.0.0-darwin-arm64.tar.gz"
      sha256 "0c6851d35232a1343830b51a6ce205fce4e4694fc7795d5fa202f1388ae8cdd3"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4175.0.0-linux-x64.tar.gz"
    sha256 "3c8129a2b5f3eafa95f8b1275d623c9af028980d10ed623da83fef23710bee95"
  end
  version "4175.0.0"
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
