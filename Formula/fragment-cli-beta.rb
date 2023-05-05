require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2598.0.0-darwin-x64.tar.gz"
    sha256 "5f85a2e96db6c0919e6abe63204d8be21b9f35f29d031f826d9befef1a7c845d"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2598.0.0-darwin-arm64.tar.gz"
      sha256 "c4ca6ced7fdcac8fb3123cb55a953227516f0409b40120c1585a7ad18b752e4c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2598.0.0-linux-x64.tar.gz"
    sha256 "dba005284d1c49495cc53bafd9b959d69468c9c3b59025033b2c6e20d427ef3a"
  end
  version "2598.0.0"
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
