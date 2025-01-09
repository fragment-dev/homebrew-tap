require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6055.0.0-darwin-x64.tar.gz"
    sha256 "c8379737213e1abc0a425d77566b5d1a9b16b7b2744fc1e352d3c0aac54c6a4a"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6055.0.0-darwin-arm64.tar.gz"
      sha256 "d27998997117a40403e6a04ebe53c9292fc77dd7fe39e6a66184989f6e3c45e0"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v6055.0.0-linux-x64.tar.gz"
    sha256 "421496c2fa2ffeb748ac75838ae17d53d68a5aa1d3bea1092a986cb0bff84249"
  end
  version "6055.0.0"
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
