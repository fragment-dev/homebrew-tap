require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3633.0.0-darwin-x64.tar.gz"
    sha256 "1a3eb4bca628d5f1aa85b19b438d0db5ff659d876dcdf7db988ca3e5763a083a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3633.0.0-darwin-arm64.tar.gz"
      sha256 "c5dba4578e2c5c137000d78acffef332df0232a6b3d15e843a1bb7a01a5ba523"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3633.0.0-linux-x64.tar.gz"
    sha256 "d5d72cf56541c3585f6bfe588de895e8cc9ebeda0c65adbbb05631327c23227f"
  end
  version "3633.0.0"
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
