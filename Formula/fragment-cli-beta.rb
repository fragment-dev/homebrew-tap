require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5934.0.0-darwin-x64.tar.gz"
    sha256 "4bc5aba1c873077cdeb2ebc11019c9264a154460c4241edb2755a3d85c778f48"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5934.0.0-darwin-arm64.tar.gz"
      sha256 "0c54b97a6ff2b4a182e3c50e8dffe6f3158824bf330638b22ec7a5f832c758b9"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5934.0.0-linux-x64.tar.gz"
    sha256 "41838ac1b162bd68d9ae4f213a345f53c5a2946309469a593ad6b6a26e21bf06"
  end
  version "5934.0.0"
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
