require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2908.0.0-darwin-x64.tar.gz"
    sha256 "8f241c05d56cabc3594f89cb179c7f966b643f54231b817043ba63c7fed5abe1"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2908.0.0-darwin-arm64.tar.gz"
      sha256 "6df21a45d72d694391b2db581400fd877f29785336181df1786e1c2230ec83e7"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v2908.0.0-linux-x64.tar.gz"
    sha256 "ece9177f0fb9aabab4abde1fbf7c4fff7fc5ee93adcf6cb7a8b5165b5f346abd"
  end
  version "2908.0.0"
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
