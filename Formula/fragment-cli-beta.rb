require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6028.0.0-darwin-x64.tar.gz"
    sha256 "e7d17e9de1df326914fb82fa6258eff2972b10d0eac9e90c12f995b5aad127b5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6028.0.0-darwin-arm64.tar.gz"
      sha256 "a26dcc71093b615b323c65e6361ee1e294ee3f9e4d673396baecb4b4e7fe1844"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6028.0.0-linux-x64.tar.gz"
    sha256 "4fcc17d9810be11579e62ed14a6cd1a60536afe39dcc9254d8d3fa63d11f3d07"
  end
  version "6028.0.0"
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
