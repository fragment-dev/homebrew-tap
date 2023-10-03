require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3751.0.0-darwin-x64.tar.gz"
    sha256 "ab18bb7554dd7aeb2f29430bef30c59d1b32d5471552312a1473af4fae0cb958"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3751.0.0-darwin-arm64.tar.gz"
      sha256 "d2be4015036dd11e57fa5d9034007642b3557236d7f4df02ba4e09c87c2eff02"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3751.0.0-linux-x64.tar.gz"
    sha256 "14618566a097b273e762269010d89a1b889a021b91bbcdccea9d3f2eb69dfb38"
  end
  version "3751.0.0"
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
