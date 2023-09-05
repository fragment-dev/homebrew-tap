require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3484.0.0-darwin-x64.tar.gz"
    sha256 "039a8caeb7f46d629d046147bbe491e196375f459f53269cf15f7ea284defbc6"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3484.0.0-darwin-arm64.tar.gz"
      sha256 "4fb2ef5341b31c76c929918bef19df47f5cebd50cc356971a25be722b59f5f46"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3484.0.0-linux-x64.tar.gz"
    sha256 "1802d7c538e0229c8a32ef6dcf07f643dec43d43ed89c382215cafe2620cd833"
  end
  version "3484.0.0"
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
