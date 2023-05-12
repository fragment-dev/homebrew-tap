require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2654.0.0-darwin-x64.tar.gz"
    sha256 "02bf26c83e9e86d3a05995a46f72b67e3c3caf190b2119dbb7325cf65b8b40ae"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2654.0.0-darwin-arm64.tar.gz"
      sha256 "a00c4d40cb96503576a676b11d6c67e53b16e9a1d03d8270c5855a39aced2acd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2654.0.0-linux-x64.tar.gz"
    sha256 "92eb3c953d0bd8b105b05c105dd731f827e0221f300c7fd81fa8fcaa43574d48"
  end
  version "2654.0.0"
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
