require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2576.0.0-darwin-x64.tar.gz"
    sha256 "23b41bb4bf09504b8650be7ea79ac56e4f46c6dbb210c6b4ca44cb8f9a939980"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2576.0.0-darwin-arm64.tar.gz"
      sha256 "1dc6fb85c6674b40b436ae5a0c0b00bc8d98688beeae427ddaef97b29e201998"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2576.0.0-linux-x64.tar.gz"
    sha256 "f0996ab178f251b80a900d45e8e6906353954d4229bd1467fbb5bdbbe9d1d8f5"
  end
  version "2576.0.0"
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
