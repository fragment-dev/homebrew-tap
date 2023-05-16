require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2671.0.0-darwin-x64.tar.gz"
    sha256 "64d305c56210ad67dbcba1a3b37c91d2ef9037f39529f7e4d1877d1fe5f6a2cb"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2671.0.0-darwin-arm64.tar.gz"
      sha256 "2c726b9098b346b130faaed968dc92293de75b2bd62db601bda397a18ab59884"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2671.0.0-linux-x64.tar.gz"
    sha256 "7a5660485df16230a2f5ac06e31058432264945f8689ff573425bb9fc935b799"
  end
  version "2671.0.0"
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
