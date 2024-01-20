require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4380.0.0-darwin-x64.tar.gz"
    sha256 "dc8a439d471e0056b5514c60ecf1b6ed5449b70d7394966d499ad1fe42cd92e4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4380.0.0-darwin-arm64.tar.gz"
      sha256 "60efe3e67682c51dda5e745fdc84a0b9f7956cd7b5d2d8785d71283f6c33d129"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4380.0.0-linux-x64.tar.gz"
    sha256 "4de58fe9c0522dc03e7bd2736fb6d53602865780d9e2c0ee94a9633072b7d31d"
  end
  version "4380.0.0"
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
