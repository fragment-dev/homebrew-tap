require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2280.0.0-darwin-x64.tar.gz"
    sha256 "e065200b9082e2c522b1e2d5ed208a545fb49875420cf555f55c136d032fb836"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2280.0.0-darwin-arm64.tar.gz"
      sha256 "b5ada86a5a5174baa4285f4fbc871212d46aebb4ad4e6cd450c329a0e9e7e30c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2280.0.0-linux-x64.tar.gz"
    sha256 "6aaeaf8887abacc3017354897404cfc91d5b5b5b8d46f924a2834b588410093b"
  end
  version "2280.0.0"
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
