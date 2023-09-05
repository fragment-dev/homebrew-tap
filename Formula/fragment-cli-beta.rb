require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3479.0.0-darwin-x64.tar.gz"
    sha256 "8ed9e8d8adbbd3e9255dc7b742779244e97bf24eb88a07b5205a97678df67c94"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3479.0.0-darwin-arm64.tar.gz"
      sha256 "bd3fb1436d75b77eda1f9ff1f4e11da487ba8783f5969778cc9ff49de9c670c5"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3479.0.0-linux-x64.tar.gz"
    sha256 "f3fe6e034774dac5dc3aaa158a120b046d9b893143e9d74b41590daf9f20060e"
  end
  version "3479.0.0"
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
