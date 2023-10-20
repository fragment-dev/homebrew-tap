require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3874.0.0-darwin-x64.tar.gz"
    sha256 "173a5a7743b7c6d051f6e3d10635c002c15d3e01b7c6d918042ae382d69d10e1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3874.0.0-darwin-arm64.tar.gz"
      sha256 "dc96cb7b6770c53cce504f7d450dc7d26028807c71b5be1af59c66381eff5d93"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3874.0.0-linux-x64.tar.gz"
    sha256 "6b6a11fee19818b1a8ea30446f3d5e0d563924cce65c4760bc07dca883b77be5"
  end
  version "3874.0.0"
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
