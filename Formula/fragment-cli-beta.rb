require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3178.0.0-darwin-x64.tar.gz"
    sha256 "5d51d6b86ca3b0d546b4016db4f5dabbb6aa6c4e45bd6f9967142802b4fd65df"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3178.0.0-darwin-arm64.tar.gz"
      sha256 "0149d507a444514d5d0500f07f01b5279a5bdec55804d4a5fd5d92ac570d3f33"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3178.0.0-linux-x64.tar.gz"
    sha256 "02b6af6ff88c3480db53e1f21beed63acd281c525e111ae3d25051c3e355731d"
  end
  version "3178.0.0"
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
