require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4277.0.0-darwin-x64.tar.gz"
    sha256 "a75e90777387c5ce549e7b74a85a88d88e97686f778223ef61d02dbecf5dcb96"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4277.0.0-darwin-arm64.tar.gz"
      sha256 "f9a5032b4e4e2ed0b92e091286f634815bbc84e67190e01e91eefb3d198d9e11"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4277.0.0-linux-x64.tar.gz"
    sha256 "5209d377c729b40466fe96b111c59fbf5ea09f190d6bd7dc9d2597b26e9c2a15"
  end
  version "4277.0.0"
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
