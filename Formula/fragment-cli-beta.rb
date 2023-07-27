require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3175.0.0-darwin-x64.tar.gz"
    sha256 "2441db1a591c7f90e087bc358425d131b9e66c9e58c1ff46e459d5855a53ed38"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3175.0.0-darwin-arm64.tar.gz"
      sha256 "b5d6c7003808ba70fdfeb34dc38f593f3ee283d81ff933a72b5b456aa2cf75ce"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3175.0.0-linux-x64.tar.gz"
    sha256 "8be483463207adea278b281431302cfe9550d00473eef5eb66cb5f83207c430f"
  end
  version "3175.0.0"
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
