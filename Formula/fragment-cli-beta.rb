require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3315.0.0-darwin-x64.tar.gz"
    sha256 "24c8b13d356a062d3f1ebaba752987ac074f79cd4d6ab33303daef59b05dce90"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3315.0.0-darwin-arm64.tar.gz"
      sha256 "b5f58528af0bada27e467e1e3955d94a1c5e253e7d7fb8dade10e93b108cdc9b"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3315.0.0-linux-x64.tar.gz"
    sha256 "8ed00e089611b6b9641b1e3e8833752acaf9aaea3f7ba083690a44b348ca151b"
  end
  version "3315.0.0"
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
