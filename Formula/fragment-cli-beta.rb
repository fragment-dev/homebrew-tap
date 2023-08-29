require "language/node"

class FragmentCliBeta < Formula
  desc "Beta version of the FRAGMENT CLI"
  homepage "https://fragment.dev"
  on_macos do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3434.0.0-darwin-x64.tar.gz"
    sha256 "be62a7a8f07c993e43b99b7c891482a9587c231a07ad68a9facebf01a9197fc5"
    on_arm do
      url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3434.0.0-darwin-arm64.tar.gz"
      sha256 "521908baa2733d015649d2619db173ef6c9267947357742c7eb30cf265cf5fae"
    end
  end
  on_linux do
    url "https://dev-fragment-cli-bucket.s3.amazonaws.com/fragment-cli-v3434.0.0-linux-x64.tar.gz"
    sha256 "e7720aecf3638c73e607589ab26e7664daf3a94256c4f5013704477b4d0d03d9"
  end
  version "3434.0.0"
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
