require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3193.0.0-darwin-x64.tar.gz"
    sha256 "3f16e490523543666d71fd2896f33f3fbd3f1cbefedb9a19a8d16ac180451ce3"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3193.0.0-darwin-arm64.tar.gz"
      sha256 "4c1b700ff328ade7947b599f43d6759a9ff762215e717bbd21a2ad577fdebbed"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3193.0.0-linux-x64.tar.gz"
    sha256 "49ee2035fc033e67416c81f22b2d20ad84612e0151c6f59c9c9996383711d9cb"
  end
  version "3193.0.0"
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
