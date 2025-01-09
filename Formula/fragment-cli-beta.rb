require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6053.0.0-darwin-x64.tar.gz"
    sha256 "dd3c309ac584c69a17ff7b24105468076444676f552f5a81e464421d2107747f"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6053.0.0-darwin-arm64.tar.gz"
      sha256 "0df3e94ef56e5c5181f8631dbd2557f2e3314c0f0c09881fcbbe87636f7e56dd"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6053.0.0-linux-x64.tar.gz"
    sha256 "d3101fac2ef70bdd3908e07f19627363373aa1216a20930ee3d34edb2011a8c5"
  end
  version "6053.0.0"
  license "MIT"
  depends_on "node@20"

  def install
    inreplace "bin/fragment", /^CLIENT_HOME=/, "export FRAGMENT_CLIENT_HOME=#{lib/"client"}\nCLIENT_HOME="
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/fragment"
  end

  test do
    system bin/"fragment", "version"
  end
end
