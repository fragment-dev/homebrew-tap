require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2953.0.0-darwin-x64.tar.gz"
    sha256 "f2b044ecce46e14c17e1a3fa1269e9cbd6a8631916771b5e643db1857b745ba4"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2953.0.0-darwin-arm64.tar.gz"
      sha256 "0aea0406df12c71f54f017912d457fc1a0b31935687f3706f16bcd2beee525ff"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2953.0.0-linux-x64.tar.gz"
    sha256 "5b19d73f3e36890f75e5260f41a764bfd16c71754733cc513d40e7a9083d908c"
  end
  version "2953.0.0"
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
