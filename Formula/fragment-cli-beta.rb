require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4576.0.0-darwin-x64.tar.gz"
    sha256 "33f70bfe572ce9336b85993eb200bd0a6f89e228e732e7f382397d4649d68eab"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4576.0.0-darwin-arm64.tar.gz"
      sha256 "915e2208a9ceec3fb960acfc8f48d997e10d60c1d0d4b045783c9b822243ecb8"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v4576.0.0-linux-x64.tar.gz"
    sha256 "7518235bf9c992867d7f6c30e6bc7b5b2ac024a8896590433882edb7d5c3262b"
  end
  version "4576.0.0"
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
