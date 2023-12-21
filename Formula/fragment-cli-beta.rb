require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4187.0.0-darwin-x64.tar.gz"
    sha256 "423fc2a581dd3e6c571a9cf8957f31883850c92bce5cb0865bd12aaa6ce0c00c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4187.0.0-darwin-arm64.tar.gz"
      sha256 "93f07d775c8d090dd249cb7b25b6ee78a6801655bba69d818c1b27bd3957c0a2"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4187.0.0-linux-x64.tar.gz"
    sha256 "fa0ce11cd6befb16bf2cf17f5163829ff4cfd95e37626d1815b67aeb9638074c"
  end
  version "4187.0.0"
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
