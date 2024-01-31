require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4469.0.0-darwin-x64.tar.gz"
    sha256 "ba765f88061e3b015ec85d90b4e86a518b7112432466944aff7b10e1f37127e6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4469.0.0-darwin-arm64.tar.gz"
      sha256 "d5c7bfc6e11c4f0db8f49a692e1e3958389fafd4a520f2282368fbb280a72f97"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4469.0.0-linux-x64.tar.gz"
    sha256 "374a997e37d3118e0b380237ab1524531bfb78d0cd5f3e6da285846aa25f9fa3"
  end
  version "4469.0.0"
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
