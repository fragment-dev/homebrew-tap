require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2348.0.0-darwin-x64.tar.gz"
    sha256 "30a224d4057d4829a8ca9d735e722428ef8fced52bf5c5bd574063993dbab63b"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2348.0.0-darwin-arm64.tar.gz"
      sha256 "3bb4492859794469cd2a45537e240f6e90bb90a6f164e63458828a9f5d669d5c"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2348.0.0-linux-x64.tar.gz"
    sha256 "75f76089114335eee101ca1609829f4659b870606111f0f3736b6f2c4e1ce59b"
  end
  version "2348.0.0"
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
