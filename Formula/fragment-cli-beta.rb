require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3407.0.0-darwin-x64.tar.gz"
    sha256 "efb0cc2842d420ccf0a4137301e0475187ccc4037631798b6c4056d4189eea50"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3407.0.0-darwin-arm64.tar.gz"
      sha256 "ec7de655ace0bfd33ae1f072340c8cb6d6ce37426093705ffe5853c088cc64a8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3407.0.0-linux-x64.tar.gz"
    sha256 "1d5e7524650d236162da69719349652d6cd043c1d17b781b37ada8513e4b6d5f"
  end
  version "3407.0.0"
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
