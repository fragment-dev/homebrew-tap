require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3064.0.0-darwin-x64.tar.gz"
    sha256 "67186d1fcf7ff3f1829ac0086f8b09165fa72317880a31362a9033d2f6fba708"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3064.0.0-darwin-arm64.tar.gz"
      sha256 "2235d0f6f194e6d0cede65a39d16a00e0640c720706a6a649e60d0d8707b8c95"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3064.0.0-linux-x64.tar.gz"
    sha256 "ff30d20921539bba05d0a9e7507e3f6a62ee7b05c95296abfdcbac752dbcf29d"
  end
  version "3064.0.0"
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
