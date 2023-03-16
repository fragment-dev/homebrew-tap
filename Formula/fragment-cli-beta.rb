require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2219.0.0-darwin-x64.tar.gz"
    sha256 "33a5708a7d5238e03e4ffb1e2ec955d0cbf998219c8b09a4f100ae20a253ba4e"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2219.0.0-darwin-arm64.tar.gz"
      sha256 "c49ea6e01b5ce00a958d1aaf4f84e5dddcdcec4d948451364532230f2ec6d179"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2219.0.0-linux-x64.tar.gz"
    sha256 "177f97c7eda5fe99a48171cb5731dfdea986486f144d9cdcb2d07a417f90e1b0"
  end
  version "2219.0.0"
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
