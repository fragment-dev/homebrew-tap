require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2584.0.0-darwin-x64.tar.gz"
    sha256 "34ba6c3950496eef5d2952dcd0665f3f49b5932d7bb8240af7b216cf58263688"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2584.0.0-darwin-arm64.tar.gz"
      sha256 "b584d70adf88261f04fea93474c3f2551b2b7510100efe041a603b9f8ec86002"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2584.0.0-linux-x64.tar.gz"
    sha256 "20c1321ab8fc08ec00faa56c2b93e92f30b8e38025e98b8e098f339640b21ff0"
  end
  version "2584.0.0"
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
