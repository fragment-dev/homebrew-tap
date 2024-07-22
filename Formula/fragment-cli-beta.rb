require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5424.0.0-darwin-x64.tar.gz"
    sha256 "461a77204eaa15cdc1b6b8d900e1b2db59e4d41f597cd8690372c350acf7947c"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5424.0.0-darwin-arm64.tar.gz"
      sha256 "c4d144de0b68a5efe6193b6256da9d3ea2642743a17e65b8092c82954bdd271a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5424.0.0-linux-x64.tar.gz"
    sha256 "9c0952d7736ac5c1f3d6aba942c1b3818a8540ada69e7feb75c158864b1dcb7c"
  end
  version "5424.0.0"
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
