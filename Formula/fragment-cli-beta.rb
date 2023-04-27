require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2532.0.0-darwin-x64.tar.gz"
    sha256 "778f20d976288abe78bdd79ef8894adc28b71e80bc30a97ee3db1dda3747f442"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2532.0.0-darwin-arm64.tar.gz"
      sha256 "5f1ca7dc71d1f90bb50bcbf7fb43b11c0431612225f180d38de60e2600f4747a"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2532.0.0-linux-x64.tar.gz"
    sha256 "24be68e3c5245545195059c4895b71641da48d3a8fc53f5f2c615153bac12fbe"
  end
  version "2532.0.0"
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
