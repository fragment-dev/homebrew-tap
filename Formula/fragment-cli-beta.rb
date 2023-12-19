require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4165.0.0-darwin-x64.tar.gz"
    sha256 "ce0b9a7f380bd5c5a825b9095b796d006d284eca15d96a8c94d93ee25a3e8f4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4165.0.0-darwin-arm64.tar.gz"
      sha256 "093cf9d8c7993ae02d1fa673bd4a6889f6c8f6f9be7add594e046c3492e6c73d"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4165.0.0-linux-x64.tar.gz"
    sha256 "6e0b82fbf73eafac2bf644102f6d084dae5142ad9e9689ebf491998301979480"
  end
  version "4165.0.0"
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
