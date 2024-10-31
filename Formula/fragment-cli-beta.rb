require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5714.0.0-darwin-x64.tar.gz"
    sha256 "3b706ca763cfa1431ad48a783bd9520f99ccc0851b6bac0790937d8f66df34a8"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5714.0.0-darwin-arm64.tar.gz"
      sha256 "ab538e8885e033de837d9e1450b0b00323c2192ce65a7d74e7e74d949f63695e"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v5714.0.0-linux-x64.tar.gz"
    sha256 "28844d93bd997a1f4c18e7e7125504cf08f39843bfb0ad4ceaa0f0d9f7ee8b78"
  end
  version "5714.0.0"
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
